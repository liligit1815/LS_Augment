.class public final synthetic Lcom/android/quickstep/util/x;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/util/AssistContentRequester;

.field public final synthetic h:Lcom/android/quickstep/util/AssistContentRequester$Callback;

.field public final synthetic i:I


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/AssistContentRequester;Lcom/android/quickstep/util/AssistContentRequester$Callback;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/x;->g:Lcom/android/quickstep/util/AssistContentRequester;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/x;->h:Lcom/android/quickstep/util/AssistContentRequester$Callback;

    .line 7
    .line 8
    iput p3, p0, Lcom/android/quickstep/util/x;->i:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/x;->g:Lcom/android/quickstep/util/AssistContentRequester;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/x;->h:Lcom/android/quickstep/util/AssistContentRequester$Callback;

    .line 4
    .line 5
    iget p0, p0, Lcom/android/quickstep/util/x;->i:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/util/AssistContentRequester;->a(Lcom/android/quickstep/util/AssistContentRequester;Lcom/android/quickstep/util/AssistContentRequester$Callback;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
