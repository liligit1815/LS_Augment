.class Lcom/android/launcher3/menu/MenuItemView$a;
.super Ljava/lang/Object;
.source "MenuItemView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


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
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuItemView$a;->g:Lcom/android/launcher3/menu/MenuItemView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuItemView$a;->g:Lcom/android/launcher3/menu/MenuItemView;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/android/launcher3/menu/MenuItemView;->a(Lcom/android/launcher3/menu/MenuItemView;)Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuItemView$a;->g:Lcom/android/launcher3/menu/MenuItemView;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/android/launcher3/menu/MenuItemView;->a(Lcom/android/launcher3/menu/MenuItemView;)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    float-to-int p1, p1

    .line 26
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuItemView$a;->g:Lcom/android/launcher3/menu/MenuItemView;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/android/launcher3/menu/MenuItemView;->a(Lcom/android/launcher3/menu/MenuItemView;)Landroid/graphics/drawable/Drawable;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/MenuItemView;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method
