.class Lcom/google/android/material/snackbar/BaseTransientBottomBar$k;
.super Ljava/lang/Object;
.source "BaseTransientBottomBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/snackbar/BaseTransientBottomBar;->k()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/google/android/material/snackbar/BaseTransientBottomBar;


# direct methods
.method constructor <init>(Lcom/google/android/material/snackbar/BaseTransientBottomBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/snackbar/BaseTransientBottomBar$k;->g:Lcom/google/android/material/snackbar/BaseTransientBottomBar;

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
    iget-object v0, p0, Lcom/google/android/material/snackbar/BaseTransientBottomBar$k;->g:Lcom/google/android/material/snackbar/BaseTransientBottomBar;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/google/android/material/snackbar/BaseTransientBottomBar;->h:Lcom/google/android/material/snackbar/BaseTransientBottomBar$o;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/google/android/material/snackbar/BaseTransientBottomBar$k;->g:Lcom/google/android/material/snackbar/BaseTransientBottomBar;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/google/android/material/snackbar/BaseTransientBottomBar;->h:Lcom/google/android/material/snackbar/BaseTransientBottomBar$o;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/google/android/material/snackbar/BaseTransientBottomBar$k;->g:Lcom/google/android/material/snackbar/BaseTransientBottomBar;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/google/android/material/snackbar/BaseTransientBottomBar;->h:Lcom/google/android/material/snackbar/BaseTransientBottomBar$o;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/google/android/material/snackbar/BaseTransientBottomBar$o;->getAnimationMode()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x1

    .line 31
    if-ne v0, v1, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Lcom/google/android/material/snackbar/BaseTransientBottomBar$k;->g:Lcom/google/android/material/snackbar/BaseTransientBottomBar;

    .line 34
    .line 35
    invoke-static {p0}, Lcom/google/android/material/snackbar/BaseTransientBottomBar;->a(Lcom/google/android/material/snackbar/BaseTransientBottomBar;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    iget-object p0, p0, Lcom/google/android/material/snackbar/BaseTransientBottomBar$k;->g:Lcom/google/android/material/snackbar/BaseTransientBottomBar;

    .line 40
    .line 41
    invoke-static {p0}, Lcom/google/android/material/snackbar/BaseTransientBottomBar;->b(Lcom/google/android/material/snackbar/BaseTransientBottomBar;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
