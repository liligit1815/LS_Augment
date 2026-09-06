.class Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;
.super Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;
.source "AICustomWidgetBottomEventLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "f"
.end annotation


# instance fields
.field private a:I

.field private b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private c:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;-><init>()V

    .line 3
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->b:Ljava/util/HashMap;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/widget/custom/ai/k;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;-><init>()V

    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->a:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->a:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic d(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;Ljava/util/HashMap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic e(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;

    .line 8
    .line 9
    iget v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->a:I

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget v2, p1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->a:I

    .line 16
    .line 17
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-static {v0, v2}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->c:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v2, p1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->c:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0, v2}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->b:Ljava/util/HashMap;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->b:Ljava/util/HashMap;

    .line 40
    .line 41
    invoke-static {p0, p1}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_1
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "ExpressInfo{statusCount="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->a:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", statusWording="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->c:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, ", statusMap="

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->b:Ljava/util/HashMap;

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p0, "}"

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method
