.class public final synthetic Lcom/android/launcher3/taskbar/h;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/taskbar/s;

.field public final synthetic b:Ljava/util/Set;

.field public final synthetic c:Z

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/s;Ljava/util/Set;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/h;->a:Lcom/android/launcher3/taskbar/s;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/h;->b:Ljava/util/Set;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/android/launcher3/taskbar/h;->c:Z

    .line 9
    .line 10
    iput p4, p0, Lcom/android/launcher3/taskbar/h;->d:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/h;->a:Lcom/android/launcher3/taskbar/s;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/h;->b:Ljava/util/Set;

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/h;->c:Z

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/taskbar/h;->d:I

    .line 8
    .line 9
    check-cast p1, Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, p0, p1}, Lcom/android/launcher3/taskbar/s;->d(Lcom/android/launcher3/taskbar/s;Ljava/util/Set;ZILjava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
