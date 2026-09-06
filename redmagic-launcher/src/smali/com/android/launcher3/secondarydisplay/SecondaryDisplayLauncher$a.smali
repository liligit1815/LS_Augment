.class Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SecondaryDisplayLauncher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->k0(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;


# direct methods
.method constructor <init>(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher$a;->g:Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher$a;->g:Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->e0(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;)Lcom/android/launcher3/allapps/r;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x4

    .line 8
    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher$a;->g:Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->d0(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {}, LG2/c;->h()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher$a;->g:Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->e0(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;)Lcom/android/launcher3/allapps/r;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getSearchUiManager()Lcom/android/launcher3/allapps/p0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p0}, Lcom/android/launcher3/allapps/p0;->f()V

    .line 39
    .line 40
    .line 41
    return-void
.end method
