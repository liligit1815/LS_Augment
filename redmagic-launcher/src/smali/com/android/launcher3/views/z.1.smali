.class public final synthetic Lcom/android/launcher3/views/z;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/views/FloatingIconView;

.field public final synthetic h:Z

.field public final synthetic i:Lcom/android/launcher3/dragndrop/DragLayer;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/views/FloatingIconView;ZLcom/android/launcher3/dragndrop/DragLayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/views/z;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/launcher3/views/z;->h:Z

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/views/z;->i:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/z;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/views/z;->h:Z

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/views/z;->i:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/views/FloatingIconView;->g(Lcom/android/launcher3/views/FloatingIconView;ZLcom/android/launcher3/dragndrop/DragLayer;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
