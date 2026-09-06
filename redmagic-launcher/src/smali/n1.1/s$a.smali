.class Ln1/s$a;
.super Landroid/util/FloatProperty;
.source "Scrim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ln1/s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/FloatProperty<",
        "Ln1/s;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/util/FloatProperty;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ln1/s;)Ljava/lang/Float;
    .locals 0

    .line 1
    iget p0, p1, Ln1/s;->b:F

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Ln1/s;F)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Ln1/s;->c(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ln1/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ln1/s$a;->a(Ln1/s;)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    check-cast p1, Ln1/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ln1/s$a;->b(Ln1/s;F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
