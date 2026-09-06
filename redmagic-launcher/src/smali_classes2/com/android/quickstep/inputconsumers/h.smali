.class public final synthetic Lcom/android/quickstep/inputconsumers/h;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;

.field public final synthetic h:Lcom/android/launcher3/logging/d;

.field public final synthetic i:J

.field public final synthetic j:I

.field public final synthetic k:Lcom/android/quickstep/NavHandle;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;Lcom/android/launcher3/logging/d;JILcom/android/quickstep/NavHandle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/h;->g:Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/h;->h:Lcom/android/launcher3/logging/d;

    .line 7
    .line 8
    iput-wide p3, p0, Lcom/android/quickstep/inputconsumers/h;->i:J

    .line 9
    .line 10
    iput p5, p0, Lcom/android/quickstep/inputconsumers/h;->j:I

    .line 11
    .line 12
    iput-object p6, p0, Lcom/android/quickstep/inputconsumers/h;->k:Lcom/android/quickstep/NavHandle;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/h;->g:Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/h;->h:Lcom/android/launcher3/logging/d;

    .line 4
    .line 5
    iget-wide v2, p0, Lcom/android/quickstep/inputconsumers/h;->i:J

    .line 6
    .line 7
    iget v4, p0, Lcom/android/quickstep/inputconsumers/h;->j:I

    .line 8
    .line 9
    iget-object v5, p0, Lcom/android/quickstep/inputconsumers/h;->k:Lcom/android/quickstep/NavHandle;

    .line 10
    .line 11
    invoke-static/range {v0 .. v5}, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->a(Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;Lcom/android/launcher3/logging/d;JILcom/android/quickstep/NavHandle;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
