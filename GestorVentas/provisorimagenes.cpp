#include "provisorimagenes.h"

ProvisorImagenes::ProvisorImagenes() : QQuickImageProvider(QQuickImageProvider::Pixmap)
{

}

QPixmap ProvisorImagenes::requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
    QPixmap pixmap(id.toLatin1());

    if (size)
      *size = pixmap.size();

    return pixmap;
}
