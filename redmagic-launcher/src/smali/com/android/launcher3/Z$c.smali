.class Lcom/android/launcher3/Z$c;
.super Lcom/android/launcher3/s$c;
.source "DefaultLayoutParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/Z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "c"
.end annotation


# instance fields
.field final synthetic c:Lcom/android/launcher3/Z;


# direct methods
.method constructor <init>(Lcom/android/launcher3/Z;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Z$c;->c:Lcom/android/launcher3/Z;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/s$c;-><init>(Lcom/android/launcher3/s;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/content/res/XmlResourceParser;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/s$c;->a(Landroid/content/res/XmlResourceParser;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b(Lorg/xmlpull/v1/XmlPullParser;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-string v0, "folderItems"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/s;->l(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/Z$c;->c:Lcom/android/launcher3/Z;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/android/launcher3/s;->e:Lcom/android/launcher3/s$h;

    .line 13
    .line 14
    invoke-interface {p1, v0}, Lcom/android/launcher3/s$h;->a(I)Landroid/content/res/XmlResourceParser;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "folder"

    .line 19
    .line 20
    invoke-static {p1, v0}, Lcom/android/launcher3/s;->g(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/s$c;->b(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method
