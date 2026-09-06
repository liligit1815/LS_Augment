.class public final synthetic Lcom/android/launcher3/taskbar/N;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


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
    iput-object p1, p0, Lcom/android/launcher3/taskbar/N;->a:Lcom/android/launcher3/taskbar/V;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/N;->a:Lcom/android/launcher3/taskbar/V;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/V;->U(Lcom/android/launcher3/taskbar/V;Lcom/android/launcher3/taskbar/bubbles/m0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
