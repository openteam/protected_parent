#encoding: utf-8
module ProtectedParent
  def self.included(base)
    base.send :extend, ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def protected_parent_of(*children_names)

      @softly_protected = children_names.extract_options!.delete(:protects) == :softly

      children_names.each do |child_name|
        self.children_of_protected_parent << child_name.to_s
      end

      before_destroy :removable?
    end

    def children_of_protected_parent
      @children_of_protected_parent ||= []
    end

    def softly_protected
      @softly_protected
    end

  end

  module InstanceMethods
    # Can the instance be deleted?
    def removable?
      self.class.softly_protected || protected_children.empty?
    end

    def protected_children
      self.class.children_of_protected_parent.select do |child|
        if a_plural child
          child unless send(child).count.zero?
        else
          child unless send(child).nil?
        end
      end
    end

    # The inverse of removable?, is this instance protected from deletion?
    def protected?
      !removable?
    end

    def a_plural(child)
      child.pluralize == child
    end
  end
end

ActiveRecord::Base.send :include, ProtectedParent
