.class public Lcom/zte/mifavor/widget/d;
.super Landroid/app/Dialog;
.source "AlertDialog.java"

# interfaces
.implements Landroid/content/DialogInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/widget/d$a;
    }
.end annotation


# static fields
.field public static final LAYOUT_HINT_NONE:I = 0x0

.field public static final LAYOUT_HINT_SIDE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "Z#AlertDialog"

.field public static final THEME_DEVICE_DEFAULT_DARK:I = 0x4

.field public static final THEME_DEVICE_DEFAULT_LIGHT:I = 0x5

.field public static final THEME_HOLO_DARK:I = 0x2

.field public static final THEME_HOLO_LIGHT:I = 0x3

.field public static final THEME_TRADITIONAL:I = 0x1


# instance fields
.field private mAlert:Lcom/zte/mifavor/widget/AlertController;

.field private mIsServiceDialog:Z

.field private mNegativeTxtColor:I

.field private mRecommendTxtColor:I


# direct methods
.method protected constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x0

    .line 1
    invoke-static {p1, v0}, Lcom/zte/mifavor/widget/d;->resolveDialogTheme(Landroid/content/Context;I)I

    move-result v0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/zte/mifavor/widget/d;-><init>(Landroid/content/Context;IZ)V

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 1

    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/d;-><init>(Landroid/content/Context;IZ)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;IZ)V
    .locals 1

    .line 3
    invoke-static {p1, p2}, Lcom/zte/mifavor/widget/d;->resolveDialogTheme(Landroid/content/Context;I)I

    move-result p2

    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    const/4 p2, 0x0

    .line 4
    iput p2, p0, Lcom/zte/mifavor/widget/d;->mRecommendTxtColor:I

    .line 5
    iput p2, p0, Lcom/zte/mifavor/widget/d;->mNegativeTxtColor:I

    .line 6
    iput-boolean p2, p0, Lcom/zte/mifavor/widget/d;->mIsServiceDialog:Z

    .line 7
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/Window;->alwaysReadCloseOnTouchAttr()V

    .line 8
    new-instance p2, Lcom/zte/mifavor/widget/AlertController;

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-direct {p2, p3, p0, v0}, Lcom/zte/mifavor/widget/AlertController;-><init>(Landroid/content/Context;Landroid/content/DialogInterface;Landroid/view/Window;)V

    iput-object p2, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p0}, Lb4/d;->d(Landroid/content/res/Resources;)Z

    move-result p0

    const-string p1, "Z#AlertDialog"

    if-eqz p0, :cond_0

    .line 10
    const-string p0, "AlertDialog out. is Landscape."

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 11
    :cond_0
    const-string p0, "AlertDialog out. is Portrait."

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ZLandroid/content/DialogInterface$OnCancelListener;)V
    .locals 2

    const/4 v0, 0x0

    .line 12
    invoke-static {p1, v0}, Lcom/zte/mifavor/widget/d;->resolveDialogTheme(Landroid/content/Context;I)I

    move-result v1

    invoke-direct {p0, p1, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 13
    iput v0, p0, Lcom/zte/mifavor/widget/d;->mRecommendTxtColor:I

    .line 14
    iput v0, p0, Lcom/zte/mifavor/widget/d;->mNegativeTxtColor:I

    .line 15
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/d;->mIsServiceDialog:Z

    .line 16
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->alwaysReadCloseOnTouchAttr()V

    .line 17
    invoke-virtual {p0, p2}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 18
    invoke-virtual {p0, p3}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 19
    new-instance p2, Lcom/zte/mifavor/widget/AlertController;

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p3

    invoke-direct {p2, p1, p0, p3}, Lcom/zte/mifavor/widget/AlertController;-><init>(Landroid/content/Context;Landroid/content/DialogInterface;Landroid/view/Window;)V

    iput-object p2, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 20
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p0}, Lb4/d;->d(Landroid/content/res/Resources;)Z

    move-result p0

    const-string p1, "Z#AlertDialog"

    if-eqz p0, :cond_0

    .line 21
    const-string p0, "AlertDialog out3. is Landscape."

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 22
    :cond_0
    const-string p0, "AlertDialog out3. is Portrait."

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method static bridge synthetic a(Lcom/zte/mifavor/widget/d;)Lcom/zte/mifavor/widget/AlertController;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 2
    .line 3
    return-object p0
.end method

.method private static isWindowMinWidthMinorFullParent(Landroid/content/Context;)Z
    .locals 4

    .line 1
    new-instance v0, Landroid/util/TypedValue;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const v1, 0x1010357

    .line 11
    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    invoke-virtual {p0, v1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/4 v1, 0x0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    return v1

    .line 22
    :cond_0
    iget p0, v0, Landroid/util/TypedValue;->type:I

    .line 23
    .line 24
    const/4 v3, 0x6

    .line 25
    if-eq p0, v3, :cond_1

    .line 26
    .line 27
    return v1

    .line 28
    :cond_1
    iget p0, v0, Landroid/util/TypedValue;->data:I

    .line 29
    .line 30
    const/high16 v0, 0x3f800000    # 1.0f

    .line 31
    .line 32
    invoke-static {p0, v0, v0}, Landroid/util/TypedValue;->complexToFraction(IFF)F

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    sub-float/2addr p0, v0

    .line 37
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    const v0, 0x3a83126f    # 0.001f

    .line 42
    .line 43
    .line 44
    cmpg-float p0, p0, v0

    .line 45
    .line 46
    if-gez p0, :cond_2

    .line 47
    .line 48
    return v2

    .line 49
    :cond_2
    return v1
.end method

.method static resolveDialogTheme(Landroid/content/Context;I)I
    .locals 2

    .line 1
    new-instance p1, Landroid/util/TypedValue;

    .line 2
    .line 3
    invoke-direct {p1}, Landroid/util/TypedValue;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget v0, LR3/c;->c:I

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p0, v0, p1, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 14
    .line 15
    .line 16
    iget p0, p1, Landroid/util/TypedValue;->resourceId:I

    .line 17
    .line 18
    return p0
.end method


# virtual methods
.method public closeSyncGravity()V
    .locals 2

    .line 1
    const-string v0, "Z#AlertDialog"

    .line 2
    .line 3
    const-string v1, "close Sync Gravity in..."

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/AlertController;->v()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public getButton(I)Landroid/widget/Button;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/AlertController;->x(I)Landroid/widget/Button;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getListView()Landroid/widget/ListView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/AlertController;->z()Lcom/zte/mifavor/widget/ListView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/AlertController;->A()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/zte/mifavor/widget/AlertController;->B(ILandroid/view/KeyEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/zte/mifavor/widget/AlertController;->C(ILandroid/view/KeyEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->onKeyUp(ILandroid/view/KeyEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 1

    .line 2
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/zte/mifavor/widget/AlertController;->G(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;Landroid/os/Message;)V

    return-void
.end method

.method public setButton(ILjava/lang/CharSequence;Landroid/os/Message;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/zte/mifavor/widget/AlertController;->G(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;Landroid/os/Message;)V

    return-void
.end method

.method public setButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, -0x1

    .line 4
    invoke-virtual {p0, v0, p1, p2}, Lcom/zte/mifavor/widget/d;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    return-void
.end method

.method public setButton(Ljava/lang/CharSequence;Landroid/os/Message;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, -0x1

    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/zte/mifavor/widget/d;->setButton(ILjava/lang/CharSequence;Landroid/os/Message;)V

    return-void
.end method

.method public setButton2(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, -0x2

    .line 2
    invoke-virtual {p0, v0, p1, p2}, Lcom/zte/mifavor/widget/d;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    return-void
.end method

.method public setButton2(Ljava/lang/CharSequence;Landroid/os/Message;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, -0x2

    .line 1
    invoke-virtual {p0, v0, p1, p2}, Lcom/zte/mifavor/widget/d;->setButton(ILjava/lang/CharSequence;Landroid/os/Message;)V

    return-void
.end method

.method public setButton3(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, -0x3

    .line 2
    invoke-virtual {p0, v0, p1, p2}, Lcom/zte/mifavor/widget/d;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    return-void
.end method

.method public setButton3(Ljava/lang/CharSequence;Landroid/os/Message;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, -0x3

    .line 1
    invoke-virtual {p0, v0, p1, p2}, Lcom/zte/mifavor/widget/d;->setButton(ILjava/lang/CharSequence;Landroid/os/Message;)V

    return-void
.end method

.method setButtonPanelLayoutHint(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/AlertController;->H(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCustomTitle(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/AlertController;->I(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIcon(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/AlertController;->J(I)V

    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/AlertController;->K(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setIconAttribute(I)V
    .locals 3

    .line 1
    new-instance v0, Landroid/util/TypedValue;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 19
    .line 20
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/AlertController;->J(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public setInverseBackgroundForced(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/AlertController;->M(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIsShowTitle()V
    .locals 2

    .line 1
    const-string v0, "Z#AlertDialog"

    .line 2
    .line 3
    const-string v1, "set Is Show Title in ..."

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/AlertController;->N()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public setMessage(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/AlertController;->O(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setNegativeButtonBackground()V
    .locals 2

    .line 1
    const-string v0, "Z#AlertDialog"

    .line 2
    .line 3
    const-string v1, "set Negative Button Background in ..."

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/AlertController;->P()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public setNegativeButtonTextColor(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "set Negative Button Text Color in. mAlert="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", color="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "Z#AlertDialog"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 34
    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/AlertController;->Q(I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public setRecommendButtonBackground()V
    .locals 2

    .line 1
    const-string v0, "Z#AlertDialog"

    .line 2
    .line 3
    const-string v1, "set Recommend Button Background in ..."

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/AlertController;->R()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public setRecommendButtonTextColor(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "set Recommend Button Text Color in ... mAlert = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", color="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "Z#AlertDialog"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 34
    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/AlertController;->S(I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public setServiceDialog()V
    .locals 2

    .line 1
    const-string v0, "Z#AlertDialog"

    .line 2
    .line 3
    const-string v1, "set Service Dialog in ..."

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/AlertController;->T()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public setSubTitle(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/AlertController;->U(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/AlertController;->V(Ljava/lang/CharSequence;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setTitleColor(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/AlertController;->W(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setView(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/AlertController;->Y(Landroid/view/View;)V

    return-void
.end method

.method public setView(Landroid/view/View;IIII)V
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    invoke-virtual/range {p0 .. p5}, Lcom/zte/mifavor/widget/AlertController;->Z(Landroid/view/View;IIII)V

    return-void
.end method

.method public setupTitle()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/d;->mAlert:Lcom/zte/mifavor/widget/AlertController;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/AlertController;->e0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public show()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lb4/d;->d(Landroid/content/res/Resources;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Lcom/zte/mifavor/widget/d;->isWindowMinWidthMinorFullParent(Landroid/content/Context;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const/4 v0, -0x1

    .line 39
    const/4 v1, -0x2

    .line 40
    invoke-virtual {p0, v0, v1}, Landroid/view/Window;->setLayout(II)V

    .line 41
    .line 42
    .line 43
    :cond_0
    const-string p0, "Z#AlertDialog"

    .line 44
    .line 45
    const-string v0, "show out."

    .line 46
    .line 47
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    return-void
.end method
