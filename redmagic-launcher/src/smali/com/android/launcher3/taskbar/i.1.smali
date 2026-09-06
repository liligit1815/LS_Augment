.class public final synthetic Lcom/android/launcher3/taskbar/i;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/taskbar/s;

.field public final synthetic b:Ljava/util/Set;

.field public final synthetic c:Z

.field public final synthetic d:I

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/s;Ljava/util/Set;ZIZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/i;->a:Lcom/android/launcher3/taskbar/s;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/i;->b:Ljava/util/Set;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/android/launcher3/taskbar/i;->c:Z

    .line 9
    .line 10
    iput p4, p0, Lcom/android/launcher3/taskbar/i;->d:I

    .line 11
    .line 12
    iput-boolean p5, p0, Lcom/android/launcher3/taskbar/i;->e:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/i;->a:Lcom/android/launcher3/taskbar/s;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/i;->b:Ljava/util/Set;

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/i;->c:Z

    .line 6
    .line 7
    iget v3, p0, Lcom/android/launcher3/taskbar/i;->d:I

    .line 8
    .line 9
    iget-boolean v4, p0, Lcom/android/launcher3/taskbar/i;->e:Z

    .line 10
    .line 11
    move-object v5, p1

    .line 12
    check-cast v5, Ljava/util/List;

    .line 13
    .line 14
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/taskbar/s;->e(Lcom/android/launcher3/taskbar/s;Ljava/util/Set;ZIZLjava/util/List;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
