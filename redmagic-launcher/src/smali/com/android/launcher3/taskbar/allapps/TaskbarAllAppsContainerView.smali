.class public Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;
.super Lcom/android/launcher3/allapps/r;
.source "TaskbarAllAppsContainerView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/allapps/r<",
        "La2/a;",
        ">;"
    }
.end annotation


# instance fields
.field private h0:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/allapps/r;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public U()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/allapps/r;->U()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;->h0:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView$a;

    .line 5
    .line 6
    invoke-static {p0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Lcom/android/launcher3/taskbar/allapps/a;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/allapps/a;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public V()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method setOnInvalidateHeaderListener(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;->h0:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView$a;

    .line 2
    .line 3
    return-void
.end method
