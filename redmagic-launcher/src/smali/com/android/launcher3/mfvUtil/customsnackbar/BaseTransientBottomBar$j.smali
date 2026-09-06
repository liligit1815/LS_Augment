.class Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$j;
.super Ljava/lang/Object;
.source "BaseTransientBottomBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;
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
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$j;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$j;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 4
    .line 5
    if-eqz v1, :cond_3

    .line 6
    .line 7
    invoke-static {v0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->b(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$j;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->h(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$j;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->i(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    sub-int/2addr v0, v1

    .line 27
    iget-object v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$j;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    float-to-int v1, v1

    .line 36
    add-int/2addr v0, v1

    .line 37
    iget-object v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$j;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 38
    .line 39
    invoke-static {v1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-lt v0, v1, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$j;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 49
    .line 50
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    instance-of v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 55
    .line 56
    if-nez v2, :cond_2

    .line 57
    .line 58
    invoke-static {}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->n()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string v0, "Unable to apply gesture inset because layout params are not MarginLayoutParams"

    .line 63
    .line 64
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 69
    .line 70
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 71
    .line 72
    iget-object v3, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$j;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 73
    .line 74
    invoke-static {v3}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    sub-int/2addr v3, v0

    .line 79
    add-int/2addr v2, v3

    .line 80
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 81
    .line 82
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$j;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->requestLayout()V

    .line 87
    .line 88
    .line 89
    :cond_3
    :goto_0
    return-void
.end method
