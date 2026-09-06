.class Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$o;
.super Ljava/lang/Object;
.source "BaseTransientBottomBar.java"

# interfaces
.implements Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$u;


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
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$o;->a:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;IIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$o;->a:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-virtual {p1, p2}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->setOnLayoutChangeListener(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$u;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$o;->a:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->j(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
