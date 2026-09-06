.class public final synthetic Lcom/android/launcher3/taskbar/m4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/util/y2$c;

.field public final synthetic b:Lcom/android/quickstep/views/RecentsView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/util/y2$c;Lcom/android/quickstep/views/RecentsView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/m4;->a:Lcom/android/launcher3/util/y2$c;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/m4;->b:Lcom/android/quickstep/views/RecentsView;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/m4;->a:Lcom/android/launcher3/util/y2$c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/m4;->b:Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    check-cast p1, [Lcom/android/systemui/shared/recents/model/Task;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/taskbar/o4;->e(Lcom/android/launcher3/util/y2$c;Lcom/android/quickstep/views/RecentsView;[Lcom/android/systemui/shared/recents/model/Task;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
