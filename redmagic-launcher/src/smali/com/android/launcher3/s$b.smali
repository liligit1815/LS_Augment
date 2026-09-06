.class public Lcom/android/launcher3/s$b;
.super Ljava/lang/Object;
.source "AutoInstallsLayout.java"

# interfaces
.implements Lcom/android/launcher3/s$i;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/s;


# direct methods
.method protected constructor <init>(Lcom/android/launcher3/s;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/s$b;->a:Lcom/android/launcher3/s;

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

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/s$b;->b(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b(Lorg/xmlpull/v1/XmlPullParser;)I
    .locals 4

    .line 1
    const-string v0, "packageName"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "className"

    .line 8
    .line 9
    invoke-static {p1, v1}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Lcom/android/launcher3/s$b;->a:Lcom/android/launcher3/s;

    .line 14
    .line 15
    invoke-static {v2, p1}, Lcom/android/launcher3/s;->b(Lcom/android/launcher3/s;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/s$b;->a:Lcom/android/launcher3/s;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 34
    .line 35
    const/4 v2, 0x2

    .line 36
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const-string v3, "restored"

    .line 41
    .line 42
    invoke-virtual {p1, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 43
    .line 44
    .line 45
    new-instance p1, Landroid/content/ComponentName;

    .line 46
    .line 47
    invoke-direct {p1, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p1}, Lcom/android/launcher3/model/data/d;->Q(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object p0, p0, Lcom/android/launcher3/s$b;->a:Lcom/android/launcher3/s;

    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 57
    .line 58
    const v1, 0x7f1402e8

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const/4 v1, 0x0

    .line 66
    invoke-virtual {p0, v0, p1, v1}, Lcom/android/launcher3/s;->e(Ljava/lang/String;Landroid/content/Intent;I)I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    return p0

    .line 71
    :cond_1
    :goto_0
    const-string p0, "AutoInstalls"

    .line 72
    .line 73
    const-string p1, "Skipping invalid <favorite> with no component"

    .line 74
    .line 75
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    const/4 p0, -0x1

    .line 79
    return p0
.end method
