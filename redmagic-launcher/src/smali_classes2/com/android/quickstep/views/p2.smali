.class public final synthetic Lcom/android/quickstep/views/p2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/quickstep/TaskIconCache$GetTaskIconCallbackMFV;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/views/TaskContainer;

.field public final synthetic b:Lcom/android/quickstep/views/TaskView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/p2;->a:Lcom/android/quickstep/views/TaskContainer;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/p2;->b:Lcom/android/quickstep/views/TaskView;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onTaskIconReceivedMFV(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/p2;->a:Lcom/android/quickstep/views/TaskContainer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/views/p2;->b:Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    move-object v2, p1

    .line 6
    move-object v3, p2

    .line 7
    move-object v4, p3

    .line 8
    move-object v5, p4

    .line 9
    move-object v6, p5

    .line 10
    move-object v7, p6

    .line 11
    invoke-static/range {v0 .. v7}, Lcom/android/quickstep/views/TaskView;->a(Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/views/TaskView;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
