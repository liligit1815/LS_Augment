.class Lcom/android/quickstep/utils/AnimationSeqHelper$1;
.super Ljava/lang/Object;
.source "AnimationSeqHelper.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/utils/AnimationSeqHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/utils/AnimationSeqHelper;


# direct methods
.method constructor <init>(Lcom/android/quickstep/utils/AnimationSeqHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/utils/AnimationSeqHelper$1;->this$0:Lcom/android/quickstep/utils/AnimationSeqHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationSeqHelper$1;->this$0:Lcom/android/quickstep/utils/AnimationSeqHelper;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/quickstep/utils/AnimationSeqHelper;->handler$lambda$0(Lcom/android/quickstep/utils/AnimationSeqHelper;Landroid/os/Message;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
