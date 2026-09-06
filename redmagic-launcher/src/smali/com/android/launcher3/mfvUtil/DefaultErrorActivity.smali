.class public final Lcom/android/launcher3/mfvUtil/DefaultErrorActivity;
.super Landroid/app/Activity;
.source "DefaultErrorActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    const-string v0, "DefaultErrorActivity"

    .line 2
    .line 3
    const-string v1, "DefaultErrorActivity_onCreate"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Lx1/e;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    const v0, 0x7f140004

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lx1/e;->n(I)Lx1/e;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const v0, 0x7f140003

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lx1/e;->d(I)Lx1/e;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance v0, Lcom/android/launcher3/mfvUtil/DefaultErrorActivity$b;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Lcom/android/launcher3/mfvUtil/DefaultErrorActivity$b;-><init>(Lcom/android/launcher3/mfvUtil/DefaultErrorActivity;)V

    .line 33
    .line 34
    .line 35
    const v1, 0x7f140001

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v1, v0}, Lx1/e;->h(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance v0, Lcom/android/launcher3/mfvUtil/DefaultErrorActivity$a;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Lcom/android/launcher3/mfvUtil/DefaultErrorActivity$a;-><init>(Lcom/android/launcher3/mfvUtil/DefaultErrorActivity;)V

    .line 45
    .line 46
    .line 47
    const p0, 0x7f140002

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, p0, v0}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lx1/e;->p()Landroid/app/Dialog;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const/4 p1, 0x0

    .line 59
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/W2;->a:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "ACTIVITY_STATE"

    .line 20
    .line 21
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 26
    .line 27
    .line 28
    return-void
.end method
