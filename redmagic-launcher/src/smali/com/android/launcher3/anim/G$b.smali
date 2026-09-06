.class Lcom/android/launcher3/anim/G$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "BoomField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/G;->f(Landroid/view/View;Landroid/animation/AnimatorListenerAdapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/View;

.field final synthetic h:Landroid/graphics/Rect;

.field final synthetic i:Landroid/animation/AnimatorListenerAdapter;

.field final synthetic j:Lcom/android/launcher3/anim/G;


# direct methods
.method constructor <init>(Lcom/android/launcher3/anim/G;Landroid/view/View;Landroid/graphics/Rect;Landroid/animation/AnimatorListenerAdapter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/G$b;->j:Lcom/android/launcher3/anim/G;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/anim/G$b;->g:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/anim/G$b;->h:Landroid/graphics/Rect;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/anim/G$b;->i:Landroid/animation/AnimatorListenerAdapter;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/anim/G$b;->j:Lcom/android/launcher3/anim/G;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/anim/G$b;->g:Landroid/view/View;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/anim/G$b;->h:Landroid/graphics/Rect;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/anim/G$b;->i:Landroid/animation/AnimatorListenerAdapter;

    .line 11
    .line 12
    invoke-static {p1, v0, v1, p0}, Lcom/android/launcher3/anim/G;->d(Lcom/android/launcher3/anim/G;Landroid/view/View;Landroid/graphics/Rect;Landroid/animation/AnimatorListenerAdapter;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
