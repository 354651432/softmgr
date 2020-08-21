project('softmgt','vala','c',version:'1.0')
gnome = import('gnome')

res = gnome.compile_resources('res','res/res.xml')

target = executable(meson.project_name(),[
        'src/ApplicationWindow.vala',
        'src/main.vala',

        'src/widgets/InstalledBox.vala',
        'src/widgets/SearchBox.vala',
        'src/widgets/SearchWidget.vala',
        'src/widgets/SearchItem.vala',
        'src/widgets/InstalledItem.vala',
        'src/widgets/DetailDialog.vala',
        'src/widgets/MessageDialog.vala',

        'src/models/IController.vala',
        'src/models/Soft.vala',

        'src/yay/YayController.vala',
        res
    ],
    dependencies:[
        dependency('gtk+-3.0'),
        dependency('gmodule-2.0'),
        dependency('gee-0.8'),
    ]
)

run_target('main',command:target)