require 'pathname'

class RelPathname < Pathname
    @initial_pwd

    def initialize p1
        @initial_pwd = Pathname.pwd

        super p1
    end

    def to_path
        (@initial_pwd + super).relative_path_from(Pathname.pwd)
    end

    def to_s
        prefix = to_path.each_filename.to_a[0] == '..' ? '' : './'
        prefix + to_path.to_s
    end

    def + p1
        RelPathname.new to_path + p1
    end

    def <=> p1
        to_path <=> p1
    end

    def == p1
        to_path == p1
    end

    def === p1
        to_path === p1
    end

    def absolute?
        to_path.absolute?
    end

    def basename
        RelPathname.new to_path.basename
    end

    def children *args
        to_path.children(*args).map do |path| RelPathname.new path end
    end

    def cleanpath *args
        RelPathname.new to_path.cleanpath(*args)
    end

    def directory?
        to_path.directory?
    end

    def dirname
        RelPathname.new to_path.dirname
    end

    def executable?
        to_path.executable?
    end

    def executable_real?
        to_path.executable_real?
    end

    def extname
        RelPathname.new to_path.extname
    end

    def file?
        to_path.file?
    end

    def mkpath
        RelPathname.new to_path.mkpath
    end

    def mtime
        to_path.mtime
    end

    def parent
        RelPathname.new to_path.parent
    end

    def relative?
        to_path.relative?
    end

    def symlink?
        to_path.symlink?
    end
end

