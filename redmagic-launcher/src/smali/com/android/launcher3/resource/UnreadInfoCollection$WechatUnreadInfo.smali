.class Lcom/android/launcher3/resource/UnreadInfoCollection$WechatUnreadInfo;
.super Lcom/android/launcher3/resource/u1$d;
.source "UnreadInfoCollection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/resource/UnreadInfoCollection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "WechatUnreadInfo"
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/u1$d;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "com.tencent.mm"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/u1$d;->setPkgName(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string p1, "com.tencent.mm.ui.LauncherUI"

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/u1$d;->setClsName(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
