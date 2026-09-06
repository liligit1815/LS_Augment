.class Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$1;
.super Ljava/lang/Object;
.source "RemoteViews.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;

.field final synthetic val$popupWindow:Lcom/zte/mifavor/widget/w;

.field final synthetic val$root:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;Lcom/zte/mifavor/widget/w;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$1;->this$1:Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$1;->val$popupWindow:Lcom/zte/mifavor/widget/w;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$1;->val$root:Landroid/view/View;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$1;->val$popupWindow:Lcom/zte/mifavor/widget/w;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$1;->val$root:Landroid/view/View;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->g(Landroid/view/View;)Landroid/widget/AdapterView;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    :try_start_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Landroid/app/PendingIntent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catch_0
    move-exception p1

    .line 22
    new-instance p2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string p4, "get pending intent error: "

    .line 28
    .line 29
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string p2, "RemoteViews"

    .line 44
    .line 45
    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    :cond_0
    const/4 p1, 0x0

    .line 49
    :goto_0
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$1;->this$1:Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;

    .line 52
    .line 53
    iget-object p2, p2, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 54
    .line 55
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->a(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    const-string p4, "android.widget.extra.LONG_CLICK"

    .line 60
    .line 61
    invoke-virtual {p2, p4, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 62
    .line 63
    .line 64
    :try_start_1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$1;->val$root:Landroid/view/View;

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const/4 p3, 0x0

    .line 71
    invoke-virtual {p1, p0, p3, p2}, Landroid/app/PendingIntent;->send(Landroid/content/Context;ILandroid/content/Intent;)V
    :try_end_1
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_1 .. :try_end_1} :catch_1

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :catch_1
    move-exception p0

    .line 76
    invoke-virtual {p0}, Landroid/app/PendingIntent$CanceledException;->printStackTrace()V

    .line 77
    .line 78
    .line 79
    :cond_1
    :goto_1
    return-void
.end method
