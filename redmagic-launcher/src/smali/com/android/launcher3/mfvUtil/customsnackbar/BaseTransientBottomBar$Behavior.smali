.class public Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$Behavior;
.super Lcom/google/android/material/behavior/SwipeDismissBehavior;
.source "BaseTransientBottomBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Behavior"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/material/behavior/SwipeDismissBehavior<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field private final r:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$s;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/behavior/SwipeDismissBehavior;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$s;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$s;-><init>(Lcom/google/android/material/behavior/SwipeDismissBehavior;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$Behavior;->r:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$s;

    .line 10
    .line 11
    return-void
.end method

.method static bridge synthetic T(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$Behavior;Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$Behavior;->U(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private U(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$Behavior;->r:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$s;->c(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public J(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$Behavior;->r:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$s;->a(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public o(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$Behavior;->r:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$s;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$s;->b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1, p2, p3}, Lcom/google/android/material/behavior/SwipeDismissBehavior;->o(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method
