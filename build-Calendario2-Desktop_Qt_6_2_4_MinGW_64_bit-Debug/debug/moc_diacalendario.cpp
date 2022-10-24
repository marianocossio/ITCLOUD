/****************************************************************************
** Meta object code from reading C++ file 'diacalendario.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.2.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../Calendario2/diacalendario.h"
#include <QtGui/qtextcursor.h>
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'diacalendario.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.2.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_DiaCalendario_t {
    const uint offsetsAndSize[14];
    char stringdata0[51];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(offsetof(qt_meta_stringdata_DiaCalendario_t, stringdata0) + ofs), len 
static const qt_meta_stringdata_DiaCalendario_t qt_meta_stringdata_DiaCalendario = {
    {
QT_MOC_LITERAL(0, 13), // "DiaCalendario"
QT_MOC_LITERAL(14, 12), // "diaClickeado"
QT_MOC_LITERAL(27, 0), // ""
QT_MOC_LITERAL(28, 1), // "f"
QT_MOC_LITERAL(30, 10), // "diaHovered"
QT_MOC_LITERAL(41, 3), // "evs"
QT_MOC_LITERAL(45, 5) // "fecha"

    },
    "DiaCalendario\0diaClickeado\0\0f\0diaHovered\0"
    "evs\0fecha"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_DiaCalendario[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    1,   26,    2, 0x06,    1 /* Public */,
       4,    2,   29,    2, 0x06,    3 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::Int,    3,
    QMetaType::Void, QMetaType::QStringList, QMetaType::Int,    5,    6,

       0        // eod
};

void DiaCalendario::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<DiaCalendario *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->diaClickeado((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 1: _t->diaHovered((*reinterpret_cast< std::add_pointer_t<QList<QString>>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<int>>(_a[2]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (DiaCalendario::*)(int );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&DiaCalendario::diaClickeado)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (DiaCalendario::*)(const QVector<QString> & , int );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&DiaCalendario::diaHovered)) {
                *result = 1;
                return;
            }
        }
    }
}

const QMetaObject DiaCalendario::staticMetaObject = { {
    QMetaObject::SuperData::link<QWidget::staticMetaObject>(),
    qt_meta_stringdata_DiaCalendario.offsetsAndSize,
    qt_meta_data_DiaCalendario,
    qt_static_metacall,
    nullptr,
qt_incomplete_metaTypeArray<qt_meta_stringdata_DiaCalendario_t
, QtPrivate::TypeAndForceComplete<DiaCalendario, std::true_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<int, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<const QVector<QString> &, std::false_type>, QtPrivate::TypeAndForceComplete<int, std::false_type>



>,
    nullptr
} };


const QMetaObject *DiaCalendario::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DiaCalendario::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_DiaCalendario.stringdata0))
        return static_cast<void*>(this);
    return QWidget::qt_metacast(_clname);
}

int DiaCalendario::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 2)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 2;
    }
    return _id;
}

// SIGNAL 0
void DiaCalendario::diaClickeado(int _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void DiaCalendario::diaHovered(const QVector<QString> & _t1, int _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
