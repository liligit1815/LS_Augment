.class public Lcom/android/launcher3/util/y2$c;
.super Ljava/lang/Object;
.source "SplitConfigurationOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/util/y2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field private a:Landroid/view/View;

.field private b:Landroid/graphics/drawable/Drawable;

.field public final c:Landroid/content/Intent;

.field public final d:Lcom/android/launcher3/util/y2$b;

.field public e:Lcom/android/launcher3/model/data/y;

.field public final f:Lcom/android/launcher3/logging/StatsLogManager$d;

.field public g:I

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/graphics/drawable/Drawable;Landroid/content/Intent;Lcom/android/launcher3/util/y2$b;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/android/launcher3/util/y2$c;->g:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/launcher3/util/y2$c;->a:Landroid/view/View;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/android/launcher3/util/y2$c;->b:Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    iput-object p3, p0, Lcom/android/launcher3/util/y2$c;->c:Landroid/content/Intent;

    .line 12
    .line 13
    iput-object p4, p0, Lcom/android/launcher3/util/y2$c;->d:Lcom/android/launcher3/util/y2$b;

    .line 14
    .line 15
    iput-object p5, p0, Lcom/android/launcher3/util/y2$c;->e:Lcom/android/launcher3/model/data/y;

    .line 16
    .line 17
    iput-object p6, p0, Lcom/android/launcher3/util/y2$c;->f:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/y2$c;->b:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Lcom/android/launcher3/model/data/y;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/y2$c;->e:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/y2$c;->a:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method
