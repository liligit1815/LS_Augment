.class Lcom/android/launcher3/C2$n;
.super Lcom/android/launcher3/anim/g;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/C2;->O4(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/C2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/C2;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/C2$n;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/C2$n;->g:Z

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/C2$n;->g:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/C2$n;->h:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/android/launcher3/C2;->r:Lcom/android/launcher3/allapps/r;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r;->getSearchUiManager()Lcom/android/launcher3/allapps/p0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Lcom/android/launcher3/allapps/p0;->getEditText()Lcom/android/launcher3/ExtendedEditText;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/C2$n;->h:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/C2;->r:Lcom/android/launcher3/allapps/r;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getSearchUiManager()Lcom/android/launcher3/allapps/p0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Lcom/android/launcher3/allapps/p0;->getEditText()Lcom/android/launcher3/ExtendedEditText;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Landroid/widget/EditText;->requestFocus()Z

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method
