.class public final synthetic Lcom/android/launcher3/taskbar/bubbles/A;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/taskbar/bubbles/B;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/bubbles/B;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/A;->a:Lcom/android/launcher3/taskbar/bubbles/B;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/A;->a:Lcom/android/launcher3/taskbar/bubbles/B;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/Float;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/B;->a(Lcom/android/launcher3/taskbar/bubbles/B;F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
