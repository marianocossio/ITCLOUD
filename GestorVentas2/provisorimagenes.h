#ifndef PROVISORIMAGENES_H
#define PROVISORIMAGENES_H

#include <QQuickImageProvider>

class ProvisorImagenes : public QQuickImageProvider
{
public:
    ProvisorImagenes();

    // QQuickImageProvider interface
public:
    virtual QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize) override;
};

#endif // PROVISORIMAGENES_H
