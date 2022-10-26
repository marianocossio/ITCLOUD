#ifndef CAMPO_H
#define CAMPO_H

#include <QWidget>
#include <QLabel>
#include <QLineEdit>

class Campo : public QWidget
{
    Q_OBJECT
public:
    explicit Campo(QWidget *parent = nullptr);
    void setLabelText(QString text);
    QString getLabelText();
    QString getLineEditText();

private:
    QLabel label;
    QLineEdit lineEdit;

protected:
    void resizeEvent(QResizeEvent* event);

signals:

};

#endif // CAMPO_H
