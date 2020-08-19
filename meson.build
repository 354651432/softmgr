project('gyay','vala','c',version:'1.0')
gnome = import('gnome')

res = gnome.compile_resources('res','res/res.xml')

target = executable(meson.project_name(),[
        'src/ApplicationWindow.vala',
        'src/main.vala',
        res
    ],
    dependencies:[
        dependency('gtk+-3.0'),
        dependency('gmodule-2.0'),
    ]
)

run_target('main',command:target)