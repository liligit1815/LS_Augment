.class public final synthetic Lcom/android/launcher3/taskbar/S2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/taskbar/X2;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/X2;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/S2;->a:Lcom/android/launcher3/taskbar/X2;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/launcher3/taskbar/S2;->b:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/S2;->a:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/S2;->b:Z

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/taskbar/X2;->h(Lcom/android/launcher3/taskbar/X2;ZLcom/android/launcher3/taskbar/bubbles/m0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
