.class public final synthetic Lcom/android/quickstep/views/k;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/views/FloatingWidgetView;

.field public final synthetic h:Lcom/android/launcher3/dragndrop/DragLayer;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/FloatingWidgetView;Lcom/android/launcher3/dragndrop/DragLayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/k;->g:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/k;->h:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/k;->g:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/k;->h:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/quickstep/views/FloatingWidgetView;->b(Lcom/android/quickstep/views/FloatingWidgetView;Lcom/android/launcher3/dragndrop/DragLayer;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
