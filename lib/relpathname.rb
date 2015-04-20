require 'pathname'

class RelPathname < Pathname
    @initial_pwd

    def initialize p1
        @initial_pwd = Pathname.pwd

        super p1
    end

    def to_pn
        Pathname.new to_path
    end

    def to_path
        (@initial_pwd + super).relative_path_from(Pathname.pwd).to_s
    end


    def to_s
        prefix = to_pn.each_filename.to_a[0] == '..' ? '' : './'
        prefix + to_path
    end

    def + p1
        RelPathname.new to_pn + p1
    end

    def <=> p1
        to_pn <=> p1
    end

    def == p1
        to_pn == p1
    end

    def === p1
        to_pn === p1
    end

    def absolute?
        to_pn.absolute?
    end

    def basename
        RelPathname.new to_pn.basename
    end

    def children *args
        to_pn.children(*args).map do |path| RelPathname.new path end
    end

    def cleanpath *args
        RelPathname.new to_pn.cleanpath(*args)
    end

    def directory?
        to_pn.directory?
    end

    def dirname
        RelPathname.new to_pn.dirname
    end

    def executable?
        to_pn.executable?
    end

    def executable_real?
        to_pn.executable_real?
    end

    def extname
        RelPathname.new to_pn.extname
    end

    def file?
        to_pn.file?
    end

    def mkpath
        RelPathname.new to_pn.mkpath
    end

    def mtime
        to_pn.mtime
    end

    def parent
        RelPathname.new to_pn.parent
    end

    def relative?
        to_pn.relative?
    end

    def symlink?
        to_pn.symlink?
    end
end

