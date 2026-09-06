.class public Lcom/android/launcher3/s$f;
.super Lcom/android/launcher3/s$e;
.source "AutoInstallsLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "f"
.end annotation


# instance fields
.field final synthetic b:Lcom/android/launcher3/s;


# direct methods
.method protected constructor <init>(Lcom/android/launcher3/s;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/s$f;->b:Lcom/android/launcher3/s;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/s$e;-><init>(Lcom/android/launcher3/s;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public c(Lorg/xmlpull/v1/XmlPullParser;)Landroid/content/ComponentName;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/s$f;->b:Lcom/android/launcher3/s;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/android/launcher3/qsb/QsbContainerView;->d(Landroid/content/Context;)Landroid/content/ComponentName;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method protected d(Landroid/content/ComponentName;Landroid/os/Bundle;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/s$f;->b:Lcom/android/launcher3/s;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const-string v2, "options"

    .line 11
    .line 12
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/s$f;->b:Lcom/android/launcher3/s;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 18
    .line 19
    const-string v1, "restored"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    or-int/lit8 v0, v0, 0x4

    .line 30
    .line 31
    iget-object v2, p0, Lcom/android/launcher3/s$f;->b:Lcom/android/launcher3/s;

    .line 32
    .line 33
    iget-object v2, v2, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 34
    .line 35
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v2, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 40
    .line 41
    .line 42
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/s$e;->d(Landroid/content/ComponentName;Landroid/os/Bundle;)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0
.end method
