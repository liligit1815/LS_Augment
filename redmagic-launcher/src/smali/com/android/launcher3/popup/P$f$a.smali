.class Lcom/android/launcher3/popup/P$f$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SystemShortcut.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/popup/P$f;->L(Lcom/android/launcher3/C2;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/C2;

.field final synthetic h:Landroid/view/View;

.field final synthetic i:Lcom/android/launcher3/popup/P$f;


# direct methods
.method constructor <init>(Lcom/android/launcher3/popup/P$f;Lcom/android/launcher3/C2;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/popup/P$f$a;->i:Lcom/android/launcher3/popup/P$f;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/popup/P$f$a;->g:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/popup/P$f$a;->h:Landroid/view/View;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/popup/P$f$a;->i:Lcom/android/launcher3/popup/P$f;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/popup/P$f$a;->g:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/popup/P$f$a;->h:Landroid/view/View;

    .line 6
    .line 7
    invoke-static {p1, v0, p0}, Lcom/android/launcher3/popup/P$f;->J(Lcom/android/launcher3/popup/P$f;Lcom/android/launcher3/C2;Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/P$f$a;->h:Landroid/view/View;

    .line 2
    .line 3
    const/16 p1, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
