.class Lcom/android/launcher3/folder/u0$p;
.super Landroid/util/Property;
.source "PreviewBackground.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/folder/u0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/Property<",
        "Lcom/android/launcher3/folder/u0;",
        "Ljava/lang/Integer;",
        ">;"
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
.method public a(Lcom/android/launcher3/folder/u0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->t(Lcom/android/launcher3/folder/u0;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public b(Lcom/android/launcher3/folder/u0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1, p0}, Lcom/android/launcher3/folder/u0;->F(Lcom/android/launcher3/folder/u0;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/launcher3/folder/u0;->N0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/u0$p;->a(Lcom/android/launcher3/folder/u0;)Ljava/lang/Integer;

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
    check-cast p1, Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/folder/u0$p;->b(Lcom/android/launcher3/folder/u0;Ljava/lang/Integer;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
