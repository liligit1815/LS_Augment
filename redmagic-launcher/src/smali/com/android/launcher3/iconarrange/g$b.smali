.class Lcom/android/launcher3/iconarrange/g$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "IconConvergeAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/iconarrange/g;->f(Lcom/android/launcher3/dragndrop/v;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/iconarrange/g;


# direct methods
.method constructor <init>(Lcom/android/launcher3/iconarrange/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/g$b;->g:Lcom/android/launcher3/iconarrange/g;

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
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/g$b;->g:Lcom/android/launcher3/iconarrange/g;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lcom/android/launcher3/iconarrange/g;->b(Lcom/android/launcher3/iconarrange/g;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/g$b;->g:Lcom/android/launcher3/iconarrange/g;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/iconarrange/g;->a(Lcom/android/launcher3/iconarrange/g;)Lcom/android/launcher3/C2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/G4;->D()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/g$b;->g:Lcom/android/launcher3/iconarrange/g;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-static {p0, p1}, Lcom/android/launcher3/iconarrange/g;->b(Lcom/android/launcher3/iconarrange/g;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
