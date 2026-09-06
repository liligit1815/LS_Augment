.class Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$2;
.super Landroid/database/ContentObserver;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$contentResolver:Landroid/content/ContentResolver;

.field final synthetic val$popupWindow:Lcom/zte/mifavor/widget/w;

.field final synthetic val$root:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;Landroid/os/Handler;Landroid/content/ContentResolver;Landroid/view/View;Lcom/zte/mifavor/widget/w;)V
    .locals 0

    .line 1
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$2;->val$contentResolver:Landroid/content/ContentResolver;

    .line 2
    .line 3
    iput-object p4, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$2;->val$root:Landroid/view/View;

    .line 4
    .line 5
    iput-object p5, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$2;->val$popupWindow:Lcom/zte/mifavor/widget/w;

    .line 6
    .line 7
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 6

    .line 1
    invoke-super {p0, p1, p2}, Landroid/database/ContentObserver;->onChange(ZLandroid/net/Uri;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "Data changed: "

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string p2, "RemoteViews"

    .line 22
    .line 23
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$2;->val$contentResolver:Landroid/content/ContentResolver;

    .line 27
    .line 28
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$2;->val$root:Landroid/view/View;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p1}, Lcom/zte/toolsdk/common/SharedPrefs;->getContentUri(Landroid/content/Context;)Landroid/net/Uri;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const/4 v4, 0x0

    .line 39
    const/4 v5, 0x0

    .line 40
    const/4 v2, 0x0

    .line 41
    const-string v3, "asrComplete"

    .line 42
    .line 43
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-eqz p2, :cond_1

    .line 54
    .line 55
    const-string p2, "value"

    .line 56
    .line 57
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    const/4 v0, 0x1

    .line 66
    if-ne p2, v0, :cond_0

    .line 67
    .line 68
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$2;->val$popupWindow:Lcom/zte/mifavor/widget/w;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 71
    .line 72
    .line 73
    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 74
    .line 75
    .line 76
    :cond_1
    return-void
.end method
