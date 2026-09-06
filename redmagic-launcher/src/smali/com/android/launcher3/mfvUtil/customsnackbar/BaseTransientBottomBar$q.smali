.class Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$q;
.super Ljava/lang/Object;
.source "BaseTransientBottomBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->p()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;


# direct methods
.method constructor <init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$q;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$q;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$q;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->getAnimationMode()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x1

    .line 21
    if-ne v0, v1, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$q;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->k(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$q;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->l(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
