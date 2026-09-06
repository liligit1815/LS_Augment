.class public final synthetic Lcom/android/launcher3/statemanager/f;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/statemanager/h;

.field public final synthetic h:Lcom/android/launcher3/statemanager/a;

.field public final synthetic i:Lcom/android/launcher3/views/BaseDragLayer;

.field public final synthetic j:I


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/statemanager/h;Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/views/BaseDragLayer;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/statemanager/f;->g:Lcom/android/launcher3/statemanager/h;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/statemanager/f;->h:Lcom/android/launcher3/statemanager/a;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/statemanager/f;->i:Lcom/android/launcher3/views/BaseDragLayer;

    .line 9
    .line 10
    iput p4, p0, Lcom/android/launcher3/statemanager/f;->j:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/f;->g:Lcom/android/launcher3/statemanager/h;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/statemanager/f;->h:Lcom/android/launcher3/statemanager/a;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/statemanager/f;->i:Lcom/android/launcher3/views/BaseDragLayer;

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/statemanager/f;->j:I

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/statemanager/h;->b0(Lcom/android/launcher3/statemanager/h;Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/views/BaseDragLayer;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
