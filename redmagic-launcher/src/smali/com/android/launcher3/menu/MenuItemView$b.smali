.class Lcom/android/launcher3/menu/MenuItemView$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MenuItemView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/menu/MenuItemView;->c(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/menu/MenuItemView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/menu/MenuItemView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuItemView$b;->g:Lcom/android/launcher3/menu/MenuItemView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuItemView$b;->g:Lcom/android/launcher3/menu/MenuItemView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/menu/MenuItemView;->b(Lcom/android/launcher3/menu/MenuItemView;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuItemView$b;->g:Lcom/android/launcher3/menu/MenuItemView;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/MenuItemView;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuItemView$b;->g:Lcom/android/launcher3/menu/MenuItemView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/menu/MenuItemView;->b(Lcom/android/launcher3/menu/MenuItemView;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuItemView$b;->g:Lcom/android/launcher3/menu/MenuItemView;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/MenuItemView;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
