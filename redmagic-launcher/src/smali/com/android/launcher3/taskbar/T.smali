.class public final synthetic Lcom/android/launcher3/taskbar/T;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/quickstep/HomeVisibilityState$VisibilityChangeListener;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/taskbar/V;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/V;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/T;->a:Lcom/android/launcher3/taskbar/V;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onHomeVisibilityChanged(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/T;->a:Lcom/android/launcher3/taskbar/V;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/V;->F(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
