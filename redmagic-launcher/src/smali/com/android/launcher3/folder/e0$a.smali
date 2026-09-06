.class Lcom/android/launcher3/folder/e0$a;
.super Landroid/util/Property;
.source "FolderPreviewItemAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/folder/e0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/Property<",
        "Lcom/android/launcher3/folder/e0;",
        "[F>;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/util/Property;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/folder/e0;)[F
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/folder/e0;->c()[F

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1}, Lcom/android/launcher3/folder/e0;->a(Lcom/android/launcher3/folder/e0;)Lcom/android/launcher3/folder/y0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Lcom/android/launcher3/folder/y0;->d:F

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    aput v0, p0, v1

    .line 13
    .line 14
    invoke-static {}, Lcom/android/launcher3/folder/e0;->c()[F

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p1}, Lcom/android/launcher3/folder/e0;->a(Lcom/android/launcher3/folder/e0;)Lcom/android/launcher3/folder/y0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget v0, v0, Lcom/android/launcher3/folder/y0;->b:F

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    aput v0, p0, v1

    .line 26
    .line 27
    invoke-static {}, Lcom/android/launcher3/folder/e0;->c()[F

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p1}, Lcom/android/launcher3/folder/e0;->a(Lcom/android/launcher3/folder/e0;)Lcom/android/launcher3/folder/y0;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget p1, p1, Lcom/android/launcher3/folder/y0;->c:F

    .line 36
    .line 37
    const/4 v0, 0x2

    .line 38
    aput p1, p0, v0

    .line 39
    .line 40
    invoke-static {}, Lcom/android/launcher3/folder/e0;->c()[F

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public b(Lcom/android/launcher3/folder/e0;[F)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/android/launcher3/folder/e0;->b(Lcom/android/launcher3/folder/e0;[F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/folder/e0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/e0$a;->a(Lcom/android/launcher3/folder/e0;)[F

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/folder/e0;

    .line 2
    .line 3
    check-cast p2, [F

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/folder/e0$a;->b(Lcom/android/launcher3/folder/e0;[F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
