.class Lcom/android/launcher3/resource/u1$a;
.super Ljava/lang/Object;
.source "UnReadInfoManager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/resource/u1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/android/launcher3/resource/u1$d;",
        ">;"
    }
.end annotation


# instance fields
.field private final g:Ljava/text/Collator;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/android/launcher3/resource/u1$a;->g:Ljava/text/Collator;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/resource/u1$d;Lcom/android/launcher3/resource/u1$d;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/u1$a;->g:Ljava/text/Collator;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/resource/u1$d;->b(Lcom/android/launcher3/resource/u1$d;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {p2}, Lcom/android/launcher3/resource/u1$d;->b(Lcom/android/launcher3/resource/u1$d;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v0, v1, v2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return v0

    .line 18
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/resource/u1$a;->g:Ljava/text/Collator;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/android/launcher3/resource/u1$d;->c(Lcom/android/launcher3/resource/u1$d;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {p2}, Lcom/android/launcher3/resource/u1$d;->c(Lcom/android/launcher3/resource/u1$d;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {p0, v0, v1}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    return p0

    .line 35
    :cond_1
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p1}, Lcom/android/launcher3/resource/u1$d;->d(Lcom/android/launcher3/resource/u1$d;)Landroid/os/UserHandle;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p2}, Lcom/android/launcher3/resource/u1$d;->d(Lcom/android/launcher3/resource/u1$d;)Landroid/os/UserHandle;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p1, p2}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    sub-int/2addr p0, p1

    .line 60
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/resource/u1$d;

    .line 2
    .line 3
    check-cast p2, Lcom/android/launcher3/resource/u1$d;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/resource/u1$a;->a(Lcom/android/launcher3/resource/u1$d;Lcom/android/launcher3/resource/u1$d;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
