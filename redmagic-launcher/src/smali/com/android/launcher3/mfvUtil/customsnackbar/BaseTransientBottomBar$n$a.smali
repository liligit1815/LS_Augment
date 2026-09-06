.class Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n$a;
.super Ljava/lang/Object;
.source "BaseTransientBottomBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n;->onViewDetachedFromWindow(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n;


# direct methods
.method constructor <init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n$a;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n;

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
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n$a;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n;->a:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 4
    .line 5
    const/4 v0, 0x3

    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->H(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
