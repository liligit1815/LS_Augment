.class Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n;
.super Ljava/lang/Object;
.source "BaseTransientBottomBar.java"

# interfaces
.implements Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$t;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->P()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;


# direct methods
.method constructor <init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n;->a:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n;->a:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n;->a:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getMandatorySystemGestureInsets()Landroid/graphics/Insets;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget p1, p1, Landroid/graphics/Insets;->bottom:I

    .line 18
    .line 19
    invoke-static {v0, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->d(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n;->a:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->m(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n;->a:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->F()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget-object p1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->s:Landroid/os/Handler;

    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n$a;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
