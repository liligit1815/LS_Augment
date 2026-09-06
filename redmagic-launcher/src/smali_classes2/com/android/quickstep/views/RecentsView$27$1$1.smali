.class Lcom/android/quickstep/views/RecentsView$27$1$1;
.super Ljava/lang/Object;
.source "RecentsView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/RecentsView$27$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/android/quickstep/views/RecentsView$27$1;

.field final synthetic val$saveMemory:J


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/RecentsView$27$1;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/RecentsView$27$1$1;->this$2:Lcom/android/quickstep/views/RecentsView$27$1;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/android/quickstep/views/RecentsView$27$1$1;->val$saveMemory:J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "SaveMemory="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-wide v1, p0, Lcom/android/quickstep/views/RecentsView$27$1$1;->val$saveMemory:J

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "RecentsView"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-wide v0, p0, Lcom/android/quickstep/views/RecentsView$27$1$1;->val$saveMemory:J

    .line 26
    .line 27
    const-wide/16 v2, 0x0

    .line 28
    .line 29
    cmp-long v0, v0, v2

    .line 30
    .line 31
    if-lez v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$27$1$1;->this$2:Lcom/android/quickstep/views/RecentsView$27$1;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView$27$1;->this$1:Lcom/android/quickstep/views/RecentsView$27;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView$27;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-wide v1, p0, Lcom/android/quickstep/views/RecentsView$27$1$1;->val$saveMemory:J

    .line 44
    .line 45
    invoke-static {v0, v1, v2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$27$1$1;->this$2:Lcom/android/quickstep/views/RecentsView$27$1;

    .line 50
    .line 51
    iget-object v1, v1, Lcom/android/quickstep/views/RecentsView$27$1;->this$1:Lcom/android/quickstep/views/RecentsView$27;

    .line 52
    .line 53
    iget-object v1, v1, Lcom/android/quickstep/views/RecentsView$27;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const v2, 0x7f140303

    .line 60
    .line 61
    .line 62
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    goto :goto_0

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$27$1$1;->this$2:Lcom/android/quickstep/views/RecentsView$27$1;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView$27$1;->this$1:Lcom/android/quickstep/views/RecentsView$27;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView$27;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const v1, 0x7f1402ca

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$27$1$1;->this$2:Lcom/android/quickstep/views/RecentsView$27$1;

    .line 89
    .line 90
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$27$1;->this$1:Lcom/android/quickstep/views/RecentsView$27;

    .line 91
    .line 92
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$27;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 93
    .line 94
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    const/4 v1, 0x0

    .line 99
    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 104
    .line 105
    .line 106
    return-void
.end method
