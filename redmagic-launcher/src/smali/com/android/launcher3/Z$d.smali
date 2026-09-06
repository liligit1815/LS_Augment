.class Lcom/android/launcher3/Z$d;
.super Ljava/lang/Object;
.source "DefaultLayoutParser.java"

# interfaces
.implements Lcom/android/launcher3/s$i;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/Z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "d"
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/Z;


# direct methods
.method constructor <init>(Lcom/android/launcher3/Z;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Z$d;->a:Lcom/android/launcher3/Z;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Z$d;->b(Lorg/xmlpull/v1/XmlPullParser;)I

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
    iget-object p1, p0, Lcom/android/launcher3/Z$d;->a:Lcom/android/launcher3/Z;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/s;->d:Landroid/content/pm/PackageManager;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/android/launcher3/util/N1;->b(Landroid/content/pm/PackageManager;)Lcom/android/launcher3/util/N1;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const-string v0, "partner_folder"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/N1;->f(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/android/launcher3/util/N1;->e()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "folder"

    .line 28
    .line 29
    invoke-static {p1, v0}, Lcom/android/launcher3/s;->g(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Lcom/android/launcher3/s$c;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/Z$d;->a:Lcom/android/launcher3/Z;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/Z;->n()Landroid/util/ArrayMap;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/s$c;-><init>(Lcom/android/launcher3/s;Landroid/util/ArrayMap;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p1}, Lcom/android/launcher3/s$c;->b(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0

    .line 48
    :cond_0
    const/4 p0, -0x1

    .line 49
    return p0
.end method
