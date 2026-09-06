.class public final synthetic Lcom/android/quickstep/h4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/RecentsModel;

.field public final synthetic h:Lcom/android/systemui/shared/system/TaskStackChangeListeners;

.field public final synthetic i:Lcom/android/launcher3/util/a2;

.field public final synthetic j:Lcom/android/launcher3/util/n1;

.field public final synthetic k:Le4/a;

.field public final synthetic l:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/RecentsModel;Lcom/android/systemui/shared/system/TaskStackChangeListeners;Lcom/android/launcher3/util/a2;Lcom/android/launcher3/util/n1;Le4/a;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/h4;->g:Lcom/android/quickstep/RecentsModel;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/h4;->h:Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/h4;->i:Lcom/android/launcher3/util/a2;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/h4;->j:Lcom/android/launcher3/util/n1;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/h4;->k:Le4/a;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/quickstep/h4;->l:Ljava/lang/Runnable;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/h4;->g:Lcom/android/quickstep/RecentsModel;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/h4;->h:Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/h4;->i:Lcom/android/launcher3/util/a2;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/h4;->j:Lcom/android/launcher3/util/n1;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/quickstep/h4;->k:Le4/a;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/quickstep/h4;->l:Ljava/lang/Runnable;

    .line 12
    .line 13
    invoke-static/range {v0 .. v5}, Lcom/android/quickstep/RecentsModel;->g(Lcom/android/quickstep/RecentsModel;Lcom/android/systemui/shared/system/TaskStackChangeListeners;Lcom/android/launcher3/util/a2;Lcom/android/launcher3/util/n1;Le4/a;Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
